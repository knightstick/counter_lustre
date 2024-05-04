import gleam/int
import lustre
import lustre/element/html.{button, div, text}
import lustre/event

type State {
  State(count: Int)
}

type Msg {
  Increment
  Decrement
}

pub fn main() {
  let app = lustre.simple(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn init(_flags) {
  State(count: 0)
}

fn update(state, msg) {
  let State(count: count) = state
  case msg {
    Increment -> State(count: count + 1)
    Decrement -> State(count: count - 1)
  }
}

fn view(state) {
  let State(state) = state
  let count = int.to_string(state)

  div([], [
    button([event.on_click(Increment)], [text("Increment")]),
    button([event.on_click(Decrement)], [text("Decrement")]),
    html.h1([], [text(count)]),
  ])
}
