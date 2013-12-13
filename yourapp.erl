% -*- mode: erlang; erlang-indent-level: 4; indent-tabs-mode: nil; fill-column: 80; comment-column: 76 -*-
-module(yourapp).

-export([start/0, stop/0]). % suggested api
% add your client api functions

%%% your api

%% invoked by you
%%
%% @doc Ensure that the applications yourapp depends on are started,
%% then start yourapp. See also yourapp_app:start/0.
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

%% invoked by you
%%
%% @doc Stop yourapp.
%%
%% The standard OTP application shutdown mechanisms are invoked.
%%
-spec stop() -> ok | {error, Reason :: term()}.
stop() ->
    application:stop(?MODULE).

% add your client api functions

%%% helper function

%% invoked by
%% yourapp:start/0
%%
%% @doc Ensure that an application depended on by yourapp is started.
%%
-spec ensure_started(App:: atom()) -> ok.
ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

%%% functions internal to your implementation

%%% testing

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

maybe_you_should_write_a_test() ->
    ?assertEqual(
       "No, but I will!",
       "Have you written any tests?"),
    ok.

-endif.

