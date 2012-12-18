%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(your_fsm).changequote(<!,!>)define(FS,1)

-behaviour(gen_fsm).
-export([init/1, handle_event/3, handle_sync_event/4]). % gen_fsm required
-export([handle_info/3, terminate/3, code_change/4]). % gen_fsm required
%-export([StateName/2, StateName/3]). % gen_fsm required per statename
-export([format_status/2]). % gen_fsm optional
-export([start_link/0]). % gen_fsm api

%%% gen_fsm required callbacks

-type result() ::
        {next_state, NextStateName :: atom(), NewStateData :: term()} |
        {next_state,
         NextStateName :: atom(),
         NewStateData :: term(),
         timeout() | hibernate} |
        {stop, Reason :: term(), NewStateData :: term()}.
-type sync_result() ::
        result() |
        {reply,
         Reply :: term(),
         NextStateName :: atom(),
         NewStateData :: term()} |
        {reply,
         Reply :: term(),
         NextStateName :: atom(),
         NewStateData :: term(),
         timeout() | hibernate} |
        {stop, Reason :: term(), Reply :: term(), NewStateData :: term()}.

include(init.fun)
include(handle_event.fun)
include(handle_sync_event.fun)
include(handle_info.fun)
include(terminate.fun)
include(code_change.fun)
include(statename2.fun)
include(statename3.fun)
%%% gen_fsm optional callback

include(format_status.fun)
%%% gen_fsm api

include(start_link.fun)
%%% functions internal to your implementation
