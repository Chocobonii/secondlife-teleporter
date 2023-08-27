vector target = <128,89,36>;
vector original_pos;
default
{
    state_entry()
    {
        llSetText("exit", <1,0,0>,1);
        llSitTarget(<0.0, 0.0, 0.1>, ZERO_ROTATION);
        original_pos = llGetPos();
        llSay(0, "Touch to teleport");
    }
    
    changed(integer change)
    {
       // llSay(0, "changed");
        key av_sit = llAvatarOnSitTarget();
        //llSay(0, "av_sit " + (string)av_sit);
        if (av_sit) 
        {
             //llSay(0,"changed state");
             state sitting;
        }
    }
}

state sitting{
    state_entry(){
        //llSay(0, "Touched.");
        original_pos = llGetPos();
        llSay(0, "Teleported");
        //llSetLinkPrimitiveParams(1, [PRIM_POSITION, target]);
        llSetRegionPos(target);
        llSleep(0.5);
        llUnSit(llAvatarOnSitTarget());
        llSleep(0.5);
        llSetRegionPos(original_pos);
        state default;
    }    
}
