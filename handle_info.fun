ifdef(<!EV!>,<!%% invoked by
%%
%% @doc Standard gen_event callback. Handle non-event information.
%%
-spec handle_info(Info :: term(), State :: term()) ->
			 {ok, NewState :: term()} |
			 {ok, NewState :: term(), hibernate} |
			 {swap_handler,
			  Args1 :: term(),
			  NewState :: term(),
			  Handler2 :: atom() | {atom(), Id :: term()},
			  Args2 :: term()} |
			 remove_handler.
handle_info(_Info, State) ->
    {ok, State}.
!>)dnl
ifdef(<!FS!>,<!%% invoked by
%% (gen_fsm:dispatch)
%%
%% @doc Standard gen_fsm callback. Handle non-request information.
%%
-spec handle_info(Info :: term(),
		  StateName :: atom(),
                  StateData :: term()) ->
			 Result :: result().
handle_info(_Info, _StateName, _State) -> result.
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% (gen_server:dispatch)
%%
%% @doc Standard gen_server callback. Handle non-request information.
%%
-spec handle_info(Info :: timeout() | term(), State :: term()) ->
                         {noreply, NewState :: term()} |
                         {noreply, NewState :: term(), timeout() | hibernate} |
                         {stop, Reason :: term(), NewState :: term()}.
handle_info(_Info, State) ->
    {noreply, State}.
!>)dnl
