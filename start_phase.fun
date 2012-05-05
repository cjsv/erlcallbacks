ifdef(<!AP!>,<!%% invoked by
%% (application_starter:run_the_phase)
%%
%% @doc Standard (optional) application callback. Execute the
%% specified start phase, perhaps ensuring dependencies start in
%% order.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete it. ***
%%
-spec start_phase(Phase :: atom(),
		  StartType :: normal |
			       {takeover, Node :: node()} |
			       {failover, Node :: node()},
		  PhaseArgs :: term()) ->
			 ok |
			 {error, Reason :: term()}.
start_phase(_Phase, _StartType, _PhaseArgs) ->
    ok.
!>)dnl
