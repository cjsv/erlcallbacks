-module(server).changequote(<!,!>)define(SE,1)

-behaviour(gen_server).
-export([init/1,handle_call/3,handle_cast/2,handle_info/2]). % required
-export([terminate/2,code_change/3]). % required
%%-export([format_status/2]). % optional
-export([start_link/0]). % api

%%% required callbacks

include(init.fun)
include(handle_call.fun)
include(handle_cast.fun)
include(handle_info.fun)
include(terminate.fun)
include(code_change.fun)
%%% optional callback

include(format_status.fun)
%%% api

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%%% implementation
