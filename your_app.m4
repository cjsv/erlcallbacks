%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_app).changequote(<!,!>)define(AP,1)

-behaviour(application).
-export([start/2, stop/1]). % application required
-export([start_phase/3, prep_stop/1, config_change/3]). % application optional
-export([start/0]). % application api

%%% application required callbacks

include(start.fun)
include(stop.fun)
%%% application optional callbacks

include(start_phase.fun)
include(prep_stop.fun)
include(config_change.fun)
%%% application api

include(start0.fun)
%%% functions internal to your implementation
