%% -*-mode:erlang; indent-tabs-mode: nil-*-
-module(your_event).changequote(<!,!>)define(EV,1)

-behaviour(gen_event).
-export([init/1,handle_event/2,handle_call/2,handle_info/2]). % required
-export([erminate/2,code_change/3]). % required
-export([format_status/2]). % optional
-export([start_link/0]). % gen_event api

%%% required callbacks

include(init.fun)
include(handle_event.fun)
include(handle_call.fun)
include(handle_info.fun)
include(terminate.fun)
include(code_change.fun)
%%% optional callback

include(format_status.fun)
%%% gen_event api

include(start_link.fun)
%%% functions internal to your implementation
