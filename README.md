# Colors.lua for Love2D from v11



> From v11, Love2D use a new format for the colors. Before, the RGB values is from 1 to 255, now it's from 0 to 1 in decimal form.

```lua
-- Old format for gray
love.graphics.setColor(128, 128, 128)

-- New format for gray
love.graphics.setColor(0.5, 0.5, 0.5)
```

## Whats new in this library ?

This lib expose two colors tables : namedColors and indexedColors. indexedColors is sorted on R, G and B values. Not the best sort type... :wink:



![](.\images\window.png)



Free to use ! ;)
