-module(event).

-behaviour(gen_event).
-export([init/1,handle_event/2,handle_call/2,handle_info/2,terminate/2,code_change/3]).
-export([format_status/2]).

%% required callbacks

% invoked by
% gen_event:add_handler, gen_event:add_sup_handler
% gen_event:swap_handler, gen_event:swap_sup_handler
% (gen_event:server_add_handler, gen_event:do_swap)
%
-spec init(InitArgs :: term()) ->
    {ok, State :: term()} |
    {ok, State :: term(), hibernate} |
    {error, Reason :: term()}.
%
init(_Args) -> {ok, nostate}.

% invoked by
% gen_event:notify, gen_event:sync_notify
%
-spec handle_event(Event :: term(), State :: term()) ->
    {ok, NewState :: term()} |
    {ok, NewState :: term(), hibernate} |
    {swap_handler, Args1 :: term(), NewState :: term(),
     Handler2 :: (atom() | {atom(), Id :: term()}), Args2 :: term()} |
    remove_handler.
%
handle_event(_Event, State) -> {ok, State}.

% invoked by
% gen_event:call
% (gen_event:server_call_update)
%
-spec handle_call(Request :: term(), State :: term()) ->
    {ok, Reply :: term(), NewState :: term()} |
    {ok, Reply :: term(), NewState :: term(), hibernate} |
    {swap_handler, Reply :: term(), Args1 :: term(), NewState :: term(),
     Handler2 :: (atom() | {atom(), Id :: term()}), Args2 :: term()} |
    {remove_handler, Reply :: term()}.
%
handle_call(_Request, State) -> {ok, reply, State}.

% invoked by
%
-spec handle_info(Info :: term(), State :: term()) ->
    {ok, NewState :: term()} |
    {ok, NewState :: term(), hibernate} |
    {swap_handler, Args1 :: term(), NewState :: term(),
     Handler2 :: (atom() | {atom(), Id :: term()}), Args2 :: term()} |
    remove_handler.
%
handle_info(_Info, State) -> {ok, State}.

% invoked by
% gen_event:delete_handler, gen_event:stop
% gen_event:swap_handler, gen_event:swap_sup_handler
% (gen_event:do_terminate)
%
-spec terminate(Args :: (term() | {stop, Reason :: term()} |
                         stop | remove_handler |
                         {error, {'EXIT', Reason :: term()}} |
                         {error, term()}),
                    State :: term()) ->
    term().
%
terminate(_Args, _State) -> ok.

% invoked by
% (gen_event:system_code_change)
%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(), Extra :: term()) ->
    {ok, NewState :: term()}.
%
code_change(_OldVsn, State, _Extra) -> {ok, State}.

%% optional callback

% invoked by
% (gen_event:format_status,gen_event:report_error)
%
format_status(_Opt, [_PDict, _State]) -> status.

%% implementation
