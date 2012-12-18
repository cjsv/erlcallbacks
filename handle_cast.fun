ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!SE!>,<!%% invoked by
%% gen_server:cast/2, gen_server:abcast/2
%% (gen_server:dispatch/3)
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
