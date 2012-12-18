ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!EV!>,<!%% invoked by
%% gen_event:call/3,4
%% (gen_event:server_call_update/3)
%%
%% @doc Standard gen_event callback. Handle synchronous requests.
%%
-spec handle_call(Request :: term(),
                  State :: term()) ->
                         {ok, Reply :: term(), NewState :: term()} |
                         {ok, Reply :: term(), NewState :: term(), hibernate} |
                         {swap_handler,
                          Reply :: term(),
                          Args1 :: term(),
                          NewState :: term(),
                          Handler2 :: atom() | {atom(), Id :: term()},
                          Args2 :: term()} |
                         {remove_handler, Reply :: term()}.
handle_call(_Request, State) ->
    {ok, reply, State}.
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% gen_server:call/2,3, gen_server:multi_call/2,3,4
%% (gen_server:handle_msg5/6)
%%
%% @doc Standard gen_server callback. Handle synchronous requests.
%%
-spec handle_call(Request :: term(),
                  From :: {pid(), Tag :: term()},
                  State :: term()) ->
                         {reply, Reply :: term(), NewState :: term()} |
                         {reply,
                          Reply :: term(),
                          NewState :: term(),
                          timeout() | hibernate} |
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop,
                          Reason :: term(),
                          Reply :: term(),
                          NewState :: term()} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_call(_Request, _From, State) ->
    {noreply, State}.
!>)dnl
