lines ← •FLines "input"

pos ← 50
count ← 0

{
  dir  ← ⊑𝕩
  dist ← •BQN 1↓𝕩
  sign ← 1 - 2 × 'L' = dir

  newPos ← pos + sign × dist
  passes ← |(⌊newPos ÷ 100 - ⌊pos ÷ 100)

  count ↩ count + passes
  pos   ↩ 100 | newPos

  @
}¨ lines

•Show (count - 1)
