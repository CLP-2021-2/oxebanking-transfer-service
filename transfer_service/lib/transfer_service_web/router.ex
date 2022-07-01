defmodule TransferServiceWeb.Router do
  use TransferServiceWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TransferServiceWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TransferServiceWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/transfers", TransferController
    resources "/transferspix", TransferPixController
    resources "/transfers_ted_doc", Transfer_ted_docController
  end

  scope "/api", TransferServiceWeb do
    pipe_through :api

    post "/transfers", TransferController, :create
    put "/transfers/:id", TransferController, :update
    delete "/transfers/:id", TransferController, :delete

    post "/transferspix", TransferPixController, :create
    put "/transferspix/:id", TransferPixController, :update
    delete "/transferspix/:id", TransferPixController, :delete

    post "/transfers_ted_doc", Transfer_ted_docController, :create
    put "/transfers_ted_doc/:id", Transfer_ted_docController, :update
    delete "/transfers_ted_doc/:id", Transfer_ted_docController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", TransferServiceWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TransferServiceWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
