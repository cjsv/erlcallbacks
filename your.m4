%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your).changequote(<!,!>)define(CL,1)

-export([start/0, stop/0]). % suggested api
% add your client api functions

%%% your api

include(start0.fun)
include(stop.fun)
% add your client api functions

%%% helper function

include(ensure_started.fun)
%%% functions internal to your implementation
