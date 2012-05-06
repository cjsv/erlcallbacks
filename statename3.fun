ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!FS!>,<!%% invoked by
%% gen_fsm:sync_send_event
%% (gen_fsm:dispatch)
%%
%% Standard gen_fsm callback for each named state. When in the named
%% state, handle the specified event synchronously and return a reply.
%%
%% *** Before correcting the function body, copy this spec and
%% function for each named state, add the state name to the -export
%% list above, then remove this -spec and function. ***
%%
-spec StateName(Event :: timeout | term(),
                From :: {pid(), Tag :: term()},
                StateData :: term()) ->
                       Result :: sync_result().
StateName(_Event, _From, State) ->
    {stop, unimplemented, State}.
!>)dnl
