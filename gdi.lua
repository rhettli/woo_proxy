local woooooooer = require('oshine/woooooo~er')

woooooooer.var.total_score = 0 -- 总变量存分数

local btn = woooooooer:newObj('button', {
    originX,
    originY,
    x,
    y,
    angle,
    gragity,
    gravity_direction,
    speed = 5, -- 精灵播放速度
    sprite_addr = woooooooer.load_sprite { path = './sprite/buttons', line_num = 10, line_from = 0, every_line_width = 10, cloum_num = 10 } --加载精灵，多张图片)
btn:addEnent(woooooooer.on_mouse_hover, function(this)
    this.opacity = 0.5 -- 设置透明度一半
end)

btn:addEnent(woooooooer.on_mouse_click, function(this)
    woooooooer.open_stage('stage-1') --跳转到新的关卡
end)

woooooooer:newObj("text-box", { originX, originY, x, y, angle, gragity, gravity_direction, sprite_addr = '' })
woooooooer:newSound('sound-btn-click', { originX, originY, x, y, angle, gragity, gravity_direction })
woooooooer:newSound('sound-op', { originX, originY, x, y, angle, gragity, gravity_direction })



woooooooer:newStage('stage-cover', {
    onReady = function()
         woooooooer.create_obj('text-box', { x = 10, y = 100 })
        woooooooer.create_obj('button', { x = 510, y = 300 })
    end,
    onDraw = function()

    end
})


woooooooer:newStage('stage-1', function()
end)



woooooooer:enter('stage-cover')
