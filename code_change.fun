ifdef(<!EV!>,<!%% invoked by
%% (gen_event:system_code_change)
%%
%% @doc Standard gen_event callback. Change State as a result of a code
%% change during release upgrade or downgrade.
%%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(),
		  Extra :: term()) ->
			 {ok, NewState :: term()}.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
!>)dnl
ifdef(<!FS!>,<!%% invoked by
%% (gen_fsm:system_code_change)
%%
%% @doc Standard gen_fsm callback. Change State as a result of a code
%% change during release upgrade or downgrade.
%%
-spec code_change(OldVsn :: term() | {down, term()},
		  StateName :: atom(),
		  StateData :: term(),
		  Extra :: term()) ->
			 {ok, NextStateName :: atom(), NewStateData :: term()}.
code_change(_OldVsn, StateName, State, _Extra) ->
    {ok, StateName, State}.
!>)dnl
ifdef(<!SE!>,<!%% invoked by
%% (gen_server:system_code_change)
%%
%% @doc Standard gen_server callback. Change State as a result of a code
%% change during release upgrade or downgrade.
%%
-spec code_change(OldVsn :: (term() | {down, term()}),
                  State :: term(),
                  Extra :: term()) ->
                         {ok, NewState :: term()} | {error, Reason :: term()}.
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
!>)dnl
