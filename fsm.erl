-module(fsm).

-behaviour(gen_fsm).
-export([init/1,handle_event/3,handle_sync_event/4,handle_info/3,terminate/3,code_change/4]). % required
% -export([StateName/2,StateName/3]). % required per statename
-export([format_status/2]). % optional

%% required callbacks

-type result() ::
    {next_state, NextStateName :: atom(), NewStateData :: term()} |
    {next_state, NextStateName :: atom(), NewStateData :: term(),
     timeout() | hibernate} |
    {stop, Reason :: term(), NewStateData :: term()}.
-type sync_result() ::
    {reply, Reply :: term(), NextStateName :: atom(), NewStateData :: term()} |
    {reply, Reply :: term(), NextStateName :: atom(), NewStateData :: term(),
     timeout() | hibernate} |
    {next_state, NextStateName :: atom(), NewStateData :: term()} |
    {next_state, NextStateName :: atom(), NewStateData :: term(),
     timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewStateData :: term()} |
    {stop, Reason :: term(), NewStateData :: term()}.

% invoked by
% gen_fsm:start_link, gen_fsm:start
% (gen_fsm:init_it)
%
-spec init(Args :: term()) ->
    {ok, StateName :: atom(), StateData :: term()} |
    {ok, StateName :: atom(), StateData :: term(), timeout() | hibernate} |
    {stop, Reason :: term()} | ignore.
%
init(_Args) -> ignore.

% invoked by
% gen_fsm:send_event
% (gen_fsm:dispatch)
%
% -spec StateName(Event :: timeout | term(), StateData :: term()) -> Result :: result().
%
% StateName(Event, State) -> Result.

% invoked by
% gen_fsm:send_all_state_event
% (gen_fsm:dispatch)
%
-spec handle_event(Event :: term(), StateName :: atom(),
                   StateData :: term()) -> Result :: result().
%
handle_event(_Event, _StateName, _State) -> result.

% invoked by
% gen_fsm:sync_send_event
% (gen_fsm:dispatch)
%
% -spec StateName(Event :: timeout | term(), From :: {pid(), Tag :: term()}, StateData :: term()) -> Result :: sync_result().
%
% StateName(Event, From, State) -> Result.

% invoked by
% gen_fsm:sync_send_all_state_event
% (gen_fsm:dispatch)
%
-spec handle_sync_event(Event :: term(), From :: {pid(), Tag :: term()},
                        StateName :: atom(), StateData :: term()) ->
    Result :: sync_result().
%
handle_sync_event(_Event, _From, _StateName, _State) -> result.

% invoked by
% (gen_fsm:dispatch)
%
-spec handle_info(Info :: term(), StateName :: atom(),
                  StateData :: term()) -> Result :: result().
%
handle_info(_Info, _StateName, _State) -> result.

% invoked by
% (gen_fsm:terminate)
%
-spec terminate(Reason :: normal | shutdown | {shutdown, term()}
	    | term(), StateName :: atom(), StateData :: term()) ->
    term().
%
terminate(_Reason, _StateName, _State) -> ok.

% invoked by
% (gen_fsm:system_code_change)
%
-spec code_change(OldVsn :: term() | {down, term()}, StateName :: atom(),
		  StateData :: term(), Extra :: term()) ->
    {ok, NextStateName :: atom(), NewStateData :: term()}.
%
code_change(_OldVsn, StateName, State, _Extra) -> {ok, StateName, State}.

%% optional callback

% invoked by
% (gen_fsm:format_status,gen_fsm_terminate)
%
format_status(_Opt, [_PDict, _State]) -> status.

%% implementation
