ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!AP!>,<!%% invoked by
%% application:stop/1
%% (application_master:loop_it/4)
%%
%% @doc Standard application callback. Stop the application.
%%
-spec stop(State :: term()) ->
                  term().
stop(_State) ->
    ok.
!>)dnl
ifdef(<!CL!>,<!%% invoked by you
%%
%% @doc Stop your application.
%%
%% The standard OTP application shutdown mechanisms are invoked.
%%
-spec stop() -> ok | {error, Reason :: term()}.
stop() ->
    application:stop(?MODULE).
!>)dnl
