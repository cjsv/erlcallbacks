ifdef(<!AP!>,<!%% invoked by
%% (application_controller:do_config_change)
%%
%% @doc Standard (optional) application callback. The application's
%% configuration has changed.
%%
%% *** If you don't want to use this callback, remove its name from
%% the -export list above and delete it. ***
%%
-spec config_change(Changed :: [{Par :: atom(), Val :: term()}],
		    New :: [{Par :: atom(), Val :: term()}],
		    Removed :: [Par :: atom()]) ->
			   ok.
config_change(_Changed, _New, _Remove) ->
    ok.
!>)dnl
