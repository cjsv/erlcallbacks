ifdef(NOTDEF, -*-mode:erlang; indent-tabs-mode: nil-*-)dnl
ifdef(<!EV!>,<!%% invoked by
%% gen_event:notify, gen_event:sync_notify
%%
%% @doc Standard gen_event callback. A specified Event has occurred.
%%
-spec handle_event(Event :: term(),
                   State :: term()) ->
                          {ok, NewState :: term()} |
                          {ok, NewState :: term(), hibernate} |
                          {swap_handler,
                           Args1 :: term(),
                           NewState :: term(),
                           Handler2 :: atom() | {atom(), Id :: term()},
                           Args2 :: term()} |
                          remove_handler.
handle_event(_Event, State) ->
    {ok, State}.
!>)dnl
ifdef(<!FS!>,<!
%% invoked by
%% gen_fsm:send_all_state_event
%% (gen_fsm:dispatch)
%%
%% @doc Standard gen_fsm callback. A specified Event has
%% occurred. Similar to the StateName/2 functions, except that the
%% same handler is called regardless of the current state.
%%
-spec handle_event(Event :: term(),
                   StateName :: atom(),
                   StateData :: term()) ->
                          Result :: result().
handle_event(_Event, _StateName, _State) ->
    {stop, unimplemented, State}.
!>)dnl
