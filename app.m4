-module(app).changequote(<!,!>)define(AP,1)

-behaviour(application).
-export([start/2,stop/1]). % required
-export([start_phase/3,prep_stop/1,config_change/3]). % optional

%%% required callbacks

include(start.fun)
include(stop.fun)
%%% optional callbacks

include(start_phase.fun)
include(prep_stop.fun)
include(config_change.fun)
%%% implementation
