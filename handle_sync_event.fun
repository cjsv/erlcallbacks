ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!FS!>,<!%% invoked by
%% gen_fsm:sync_send_all_state_event
%% (gen_fsm:dispatch)
%%
%% @doc Standard gen_fsm callback. Similar to the StateName/3
%% functions, except that the same handler is called regardless of the
%% current state.
%%
-spec handle_sync_event(Event :: term(),
                        From :: {pid(), Tag :: term()},
                        StateName :: atom(),
                        StateData :: term()) ->
                               Result :: sync_result().
handle_sync_event(_Event, _From, _StateName, State) ->
    {stop, unimplemented, State}.
!>)dnl
