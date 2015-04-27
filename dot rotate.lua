u1x=2
u1y=6
u2x=4
u2y=6
u3x=6
u3y=6
l1x=2
l1y=4
l2x=4
l2y=4
l3x=6
l3y=4
cg_magnet_x=(2+6)/2
cg_magnet_y=(4+6)/2
mi_selectgroup(1)
mi_moverotate(cg_magnet_x,cg_magnet_y,90)

for n=0,10 do
u1x=u1x-cg_magnet_x
u1y=u1y-cg_magnet_y
u1x=u1x*cos(pi/2)-u1y*sin(pi/2)
u1y=u1x*sin(pi/2)+u1y*cos(pi/2)
u1x=u1x+cg_magnet_x
u1y=u1y+cg_magnet_y

u2x=u2x-cg_magnet_x
u2y=u2y-cg_magnet_y
u2x=u2x*cos(pi/2)-u2y*sin(pi/2)
u2y=u2x*sin(pi/2)+u2y*cos(pi/2)
u2x=u2x+cg_magnet_x
u2y=u2y+cg_magnet_y

l2x=l2x-cg_magnet_x
l2y=l2y-cg_magnet_y
l2x=l2x*cos(pi/2)-l2y*sin(pi/2)
l2y=l2x*sin(pi/2)+l2y*cos(pi/2)
l2x=l2x+cg_magnet_x
l2y=l2y+cg_magnet_y

l1x=l1x-cg_magnet_x
l1y=l1y-cg_magnet_y
l1x=l1x*cos(pi/2)-l1y*sin(pi/2)
l1y=l1x*sin(pi/2)+l1y*cos(pi/2)
l1x=l1x+cg_magnet_x
l1y=l1y+cg_magnet_y

u1y=u1y-1
u2y=u2y+1
l2y=l2y-1
l1y=l1y-3

end

mo_addcontour(u1x-0.5,u1y-0.5)
mo_addcontour(u2x-0.5,u2y)
mo_addcontour(l2x+0.5,l2y)
mo_addcontour(l1x+0.5,l1y-0.5)
mo_addcontour(u1x-0.5,u1y-0.5)

