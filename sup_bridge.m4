-module(sup_bridge).changequote(<!,!>)define(SB,1)

-behaviour(supervisor_bridge).
-export([init/1,terminate/2]). % required

%%% required callbacks

include(init.fun)
include(terminate.fun)
%%% implementation
