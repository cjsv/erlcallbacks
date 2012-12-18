ifdef(NOTDEF, -*- mode: erlang; indent-tabs-mode: nil -*-)dnl
ifdef(<!CL!>,<!%% invoked by
%% your:start/0
%%
%% @doc Ensures that an application depended on by your application is started.
%%
-spec ensure_started(App:: atom()) -> ok.
ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
!>)dnl
