ifdef(NOTDEF, -*-mode:erlang; indent-tabs-mode: nil-*-)dnl
ifdef(<!SE!>,<!%% invoked by
%% gen_server:cast, gen_server:abcast
%% (gen_server:dispatch)
%%
%% @doc Standard gen_server callback. Handle a request not requiring a
%% reply.
%%
-spec handle_cast(Request :: term(),
                  State :: term()) ->
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_cast(_Request, State) ->
    {noreply, State}.
!>)dnl
