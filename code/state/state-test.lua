require("code.state.state")

--[[
		Context theContext = new Context();
		theContext.SetState( new ConcreteStateA( theContext ));
		theContext.Request( 5 );
		theContext.Request( 15 );
		theContext.Request( 25 );
		theContext.Request( 35 );
]]

print " "

local theContext = Context()
print ("theContext name= " .. theContext.name)
print " "
local csa = ConcreteStateA(theContext)
theContext:SetState( csa )
theContext:Request(5)
theContext:Request(15)
theContext:Request(25)
theContext:Request(35)