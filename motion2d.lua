showconsole()
mydir="./"
open(mydir .. "motion2d.fem")
mi_saveas(mydir .. "demo.fem")
mi_seteditmode("group")
vx_init=0
vy_init=0
dt=0.05
m=1.101
for n=0,15 do
    mi_analyze(1)
    mi_loadsolution()
    mo_zoom(-40,-90,50,40) 
    mo_savebitmap(format("ss_%1$d.bmp",n))
    mo_groupselectblock(1)
    fx=mo_blockintegral(18)
    fy=mo_blockintegral(19)-(m*9.8)
    ax=(fx/m)
    ay=(fy/m)
    dvx=ax*dt
    dvy=ay*dt
dx=vx_init*dt+(0.5*ax*dt*dt)
dy=vy_init*dt+(0.5*ay*dt*dt)
dx=dx/0.0254
dy=dy/0.0254
vx_init=vx_init+dvx
vy_init=vy_init+dvy
print(fx,fy)
    if (n<15) then
        mi_selectgroup(1)
        mi_movetranslate(dx,dy)
    end
end
mo_close()
mi_close()