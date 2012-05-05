ifdef(<!FS!>,<!%% invoked by
%% gen_fsm:send_event
%% (gen_fsm:dispatch)
%%
%% Standard gen_fsm callback for each named state. When in the named
%% state, handle the specified event. No reply is expected.
%%
%% *** Before correcting the function body, copy this spec and
%% function for each named state, add it to the -export list above,
%% then remove this instance. ***
%%
-spec StateName(Event :: timeout | term(),
                StateData :: term()) ->
                       Result :: result().
StateName(Event, State) ->
    {stop, unimplemented, []}.
!>)dnl
