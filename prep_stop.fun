ifdef(NOTDEF, -*-mode:erlang; indent-tabs-mode: nil-*-)dnl
ifdef(<!AP!>,<!%% invoked by
%% application:stop
%% (application_master:prep_stop)
%%
%% @doc Standard (optional) application callback. Prepare to stop the
%% application, perhaps to persist state.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete this -spec and function. ***
%%
-spec prep_stop(State :: term()) ->
                       NewState :: term().
prep_stop(State) ->
    State.
!>)dnl
