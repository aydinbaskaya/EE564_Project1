showconsole()
mydir="./"
open(mydir .. "rotation.fem")
mi_saveas(mydir .. "demo.fem")
mi_seteditmode("group")
vx_init=0
vy_init=0
dt=0.05
theta=0
dw=0
m=1.101
vert_force_left=0
vert_force_right=0
torgue_l=0
torgue_r=0
cg_left_x=(0+2.5)/2
cg_left_y=(2+4)/2
cg_magnet_x=(0+5)/2
cg_magnet_y=(2+4)/2
for n=0,5 do
    mi_analyze()
    mi_loadsolution()
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
dy=dy/0.254
vx_init=vx_init+dvx
vy_init=vy_init+dvy
mo_clearblock()
mo_selectblock(cg_left_x,cg_left_y)
vert_force_left=mo_blockintegral(19)
vert_force_right=fy-vert_force_left
mo_clearblock()  
   if(vert_force_left>vert_force_right) then
            netforce=vert_force_left-vert_force_right
            nettorque=netforce*1.25
            mo_groupselectblock(1)
            dw=nettorque/(mo_blockintegral(24)*8400)
            theta=theta+dw*dt
            theta=theta*(180/3.14)
            mo_clearblock()    
      elseif(vert_force_left<vert_force_right) then
            netforce=vert_force_right-vert_force_left
            nettorque=netforce*1.25
            mo_groupselectblock(1)
            dw=nettorque/(mo_blockintegral(24)*8400)
            theta=theta+dw*dt
            theta=theta*(180/3.14)
            mo_clearblock()  
      elseif(vert_force_left==vert_force_right) then
            netforce=0
            nettorque=0
            dw=0
            theta=theta+dw*dt
            theta=theta*(180/3.14)
  end             
print(fx,fy,nettorque)
    if (n<5) then
        mi_selectgroup(1)
        mi_moverotate(cg_magnet_x,cg_magnet_y,theta)
        mi_movetranslate(dx,dy)
        cg_magnet_x=cg_magnet_x+dx
        cg_magnet_y=cg_magnet_y+dy
        cg_left_x=cg_left_x+dx
        cg_left_y=cg_left_y+dy
   end
end