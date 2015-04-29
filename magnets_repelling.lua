showconsole()
mydir="./"
open(mydir .. "magnets_repelling.fem")
mi_saveas(mydir .. "demo.fem")
mi_seteditmode("group")
vx_init=0
vy_init=0
dt=0.01
w_init=0
dw=0
theta=0
angular_acc=0
m=0.82
inertia=0.00022
torque=0
cg_magnet_x=(0+5)/2
cg_magnet_y=(3+5)/2
for n=0,50 do
    mi_analyze(1)
    mi_loadsolution()
    mo_shownames(1)    
    mo_zoom(-25,-40,45,30)
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
mo_clearblock() 
mo_groupselectblock(2)
torque=(-1)*mo_blockintegral(22)
    angular_acc=torque/inertia
    dw=angular_acc*dt
    w_init=w_init+dw
    theta=w_init*dt
    theta=theta*(180/pi)
   mo_clearblock()
print(fx,fy,torque,inertia,theta)
    if (n<50) then
        mi_selectgroup(1)
        mi_moverotate(cg_magnet_x,cg_magnet_y,theta)
        mi_selectgroup(1)        
        mi_movetranslate(dx,dy)
        cg_magnet_x=cg_magnet_x+dx
        cg_magnet_y=cg_magnet_y+dy
         if (cg_magnet_x*cg_magnet_x+cg_magnet_y*cg_magnet_y)  <4 then
                messagebox("magnets sticked on each other!")
                pause()
         end
     end
end