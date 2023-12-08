def hello := "world"

class AsState (State : Type w_w)

class AsObservableWorldState (State : Type w_w) extends AsState State


class Observational (Observer : Type u) where
  index : Observer → {Index : Type v} → Index
  state : Observer → {State : Type w} → State

inductive ObservableWorld.{u,v,w,v_w,w_w} where
| mk : [Observational.{u,v,w} Observer] → Observer → {Index : Type v_w} → Index → {State : Type w_w} → State → ObservableWorld

structure GodObserver where
  index {Index : Type v} : Index
  state {State : Type w} : State

namespace GodObserver

instance instGodObserverObservational.{v,w} : Observational.{max (v + 1) (w + 1),v,w} GodObserver.{v,w} where
  index := index
  state := state

end GodObserver

structure OrdinaryObserver.{u,v,w,v_w,w_w} (world : ObservableWorld.{u,v,w,v_w,w_w}) where
  index {Index : Type v} : Index
  state {State : Type w} : State

namespace OrdinaryObserver

instance instOrdinaryObserverObservational.{u,v,w,v_w,w_w} (world : ObservableWorld.{u,v,w,v_w,w_w}) : Observational.{(max (v + 1) (w + 1)),v,w} (OrdinaryObserver.{u,v,w} world) where
  index := index
  state := state

end OrdinaryObserver
-- mutual

-- inductive GodObserver where
-- | mk : Index → State → GodObserver

-- inductive ObservableWorld where
-- | mk : GodObserver → Index → State → ObservableWorld

-- end

-- mutual

-- inductive Observer (world : ObservableWorld) where
-- | mem : Index → State → Observer world

-- end
