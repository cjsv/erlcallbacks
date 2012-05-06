ifdef(NOTDEF, -*-mode:erlang; indent-tabs-mode: nil-*-)dnl
ifdef(<!AP!>,<!%% invoked by
%% application:start
%% (application_master:start_it_old,application_master:start_supervisor)
%%
%% @doc Standard application callback. Start the application's supervisor.
%%
%% *** Change your_sup below to the name of your supervisor callback
%% module. ***
%%
-spec start(StartType :: normal |
                         {takeover, Node :: node()} |
                         {failover, Node :: node()},
            StartArgs :: term()) ->
                   {ok, pid()} |
                   {ok, pid(), State :: term()} |
                   {error, Reason :: term()}.
start(_StartType, _StartArgs) ->
    your_sup:start_link().
!>)dnl
