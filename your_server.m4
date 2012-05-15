%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_server).changequote(<!,!>)define(SE,1)

-behaviour(gen_server).
-export([init/1,handle_call/3,handle_cast/2]). % gen_server required
-export([handle_info/2,terminate/2,code_change/3]). % gen_server required
%%-export([format_status/2]). % gen_server optional
-export([start_link/0]). % gen_server api

%%% gen_server required callbacks

include(init.fun)
include(handle_call.fun)
include(handle_cast.fun)
include(handle_info.fun)
include(terminate.fun)
include(code_change.fun)
%%% gen_server optional callback

include(format_status.fun)
%%% gen_server api

include(start_link.fun)
%%% functions internal to your implementation
