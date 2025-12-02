lines ← •FLines "input"

pos ← 50
count ← 0

{
  dir ← ⊑𝕩
  dist ← •BQN 1↓𝕩
  sign ← 1 - 2 × 'L' = dir # +1 if R, -1 if L
  pos ↩ 100 | (pos + sign × dist) # Modulo 100 Wrapparound
  
  count ↩ count + (0 = pos)
  
  @
}¨ lines
•Show count