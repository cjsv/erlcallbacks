%% -*- mode: erlang; indent-tabs-mode: nil -*-
-module(yourapp).

-export([start/0, stop/0]). % suggested api
% add yourapp client api functions

%%% yourapp api

%% invoked by you
%%
%% @doc Start the applications yourapp depends on, then start yourapp.
%% See also yourapp_app:start/0.
%%
%% The standard OTP application startup mechanisms are invoked.
%%
%% *** Change yourapp_app below to the name of your application callback
%% module. ***
%%
-spec start() ->
                   ok |
                   {error, Reason :: term()}.
start() ->
    yourapp_app:start().

%% invoked by you
%%
%% @doc Stop yourapp application.
%%
%% The standard OTP application shutdown mechanisms are invoked.
%%
%% *** Change yourapp_app below to the name of your application callback
%% module. ***
%%
-spec stop() ->
                  ok |
                  {error, Reason :: term()}.
stop() ->
    yourapp_app:stop().

% add yourapp client api functions

%%% functions internal to yourapp implementation
