#import "../../src/lib.typ" : ghs
#set page(width: auto, height: auto, margin: 0pt)

#grid(
  columns: 9,
  ..range(1,10).map(x=> ghs(x))
)