-module(server).

-behaviour(gen_server).
-export([init/1,handle_call/3,handle_cast/2,handle_info/2,terminate/2,code_change/3]). % required
-export([format_status/2]). % optional
-export([start_link/0]). % api

%% required callbacks

% invoked by
% gen_server:start_link, gen_server:start
% (gen_server:init_it)
%
-spec init(Args :: term()) ->
    {ok, State :: term()} | {ok, State :: term(), timeout() | hibernate} |
    {stop, Reason :: term()} | ignore.
%
init(Args) ->
    {ok, Args}.

% invoked by
% gen_server:call, gen_server:multi_call
% (gen_server:handle_msg)
%
-spec handle_call(Request :: term(), From :: {pid(), Tag :: term()},
                  State :: term()) ->
    {reply, Reply :: term(), NewState :: term()} |
    {reply, Reply :: term(), NewState :: term(), timeout() | hibernate} |
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), Reply :: term(), NewState :: term()} |
    {stop, Reason :: term(), NewState :: term()}.
%
handle_call(_Request, _From, State) -> {noreply, State}.

% invoked by
% gen_server:cast, gen_server:abcast
% (gen_server:dispatch)
%
-spec handle_cast(Request :: term(), State :: term()) ->
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: term()}.
%
handle_cast(_Request, State) -> {noreply, State}.

% invoked by
% (gen_server:dispatch)
%
-spec handle_info(Info :: timeout() | term(), State :: term()) ->
    {noreply, NewState :: term()} |
    {noreply, NewState :: term(), timeout() | hibernate} |
    {stop, Reason :: term(), NewState :: term()}.
%
handle_info(_Info, State) -> {noreply, State}.

% invoked by
% (gen_server:terminate)
%
-spec terminate(Reason :: (normal | shutdown | {shutdown, term()} |
                           term()),
                    State :: term()) ->
    term().
%
terminate(_Reason, _State) -> ok.

% invoked by
% (gen_server:system_code_change)
%
-spec code_change(OldVsn :: (term() | {down, term()}), State :: term(),
                  Extra :: term()) ->
    {ok, NewState :: term()} | {error, Reason :: term()}.
%
code_change(_OldVsn, State, _Extra) -> {ok, State}.

%% optional callback

% invoked by
% (gen_server:format_status,gen_server:terminate)
%
format_status(_Opt, [_PDict, _State]) -> status.

%% api

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

%% implementation
