ifdef(<!FS!>,<!%% invoked by
%% gen_fsm:sync_send_event
%% (gen_fsm:dispatch)
%%
%% Standard gen_fsm callback for each named state. When in the named
%% state, handle the specified event synchronously and return a reply.
%%
%% *** Before correcting the function body, copy this spec and
%% function for each named state, add it to the -export list above,
%% then remove this instance. ***
%%
-spec StateName(Event :: timeout | term(),
                From :: {pid(), Tag :: term()},
                StateData :: term()) ->
                       Result :: sync_result().
StateName(Event, From, State) ->
    {stop, unimplemented, []}.
!>)dnl
