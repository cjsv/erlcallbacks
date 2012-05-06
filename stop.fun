ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!AP!>,<!%% invoked by
%% application:stop
%% (application_master:loop_it)
%%
%% @doc Standard application callback. Stop the application.
%%
-spec stop(State :: term()) ->
                  term().
stop(_State) ->
    ok.
!>)dnl
