ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!AP!>,<!%% invoked by you
%%
%% @doc API to start application. See also your:start/0.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    application:start(?MODULE).
!>)dnl
ifdef(<!CL!>,<!%% invoked by you
%%
%% @doc Ensure that the applications your application depends on,are
%% started, then start yours. See also your_app:start/0.
%%
%% The standard OTP application startup mechanisms are invoked.
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    %% add applications you depend on
    %ensure_started(crypto),
    application:start(?MODULE).
!>)dnl
