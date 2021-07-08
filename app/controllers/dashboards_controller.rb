# frozen_string_literal: true

class DashboardsController < ApplicationController
  def show
    @gadgets = @current_vendor_group.dashboards.first.gadgets

    @gadgets_data = @gadgets.map { |g| g.attributes.merge({ chart_data: ChartDataService.perform(gadget: g, vendor_group: @current_vendor_group) }) }

    if @current_vendor_group.dashboards.first.dashboard_layout.present?
      @layout = @current_vendor_group.dashboards.first.dashboard_layout.layout
    else
      @layout = { layout: [] }
    end

    # @sales_price_amount_graph_data = { name: [], sales_price_amount: [], path: [] }
    # @sales_amount_graph_data = { name: [], sales_amount: {}, path: [] }
    # @sales_price_amount_stack_graph_data = { name: [], sales_price_amount: {}, path: [] }
    # @sales_amount_vs_price_graph_data = { sales_amount: [], sales_price_amount: [], name: [] }
    # @contracts_scatter_graph_data = { sales_amount: [], sales_price_amount: [], company_name: [], product_name: [] }

    # partners = @current_vendor_group.partners.order(created_at: "ASC").decorate
    # partners.each do |partner|
    #   @sales_price_amount_graph_data[:name] << partner.name
    #   @sales_price_amount_graph_data[:path] << partner_path(uid: partner.uid)
    #   @sales_price_amount_graph_data[:sales_price_amount] << partner.sales_price_amount

    #   @sales_amount_graph_data[:name] << partner.name
    #   @sales_amount_graph_data[:path] << partner_path(uid: partner.uid)

    #   @sales_price_amount_stack_graph_data[:name] << partner.name
    #   @sales_price_amount_stack_graph_data[:path] << partner_path(uid: partner.uid)

    #   @sales_amount_vs_price_graph_data[:sales_amount] << partner.sales_amount
    #   @sales_amount_vs_price_graph_data[:sales_price_amount] << partner.sales_price_amount
    #   @sales_amount_vs_price_graph_data[:name] << partner.name
    # end

    # products = @current_vendor_group.products.order(created_at: "DESC").decorate
    # products.each do |product|
    #   @sales_amount_graph_data[:sales_amount][product.name] = []
    #   @sales_price_amount_stack_graph_data[:sales_price_amount][product.name] = []
    #   partners.each do |partner|
    #     contracts = @current_vendor_group.contracts.where(product: product, company: partner)
    #     sales_amount = 0
    #     sales_price_amount = 0
    #     contracts.each do |contract|
    #       sales_amount += contract.sales_amount
    #       sales_price_amount += contract.sales_price_amount
    #     end

    #     @sales_amount_graph_data[:sales_amount][product.name] << sales_amount

    #     @sales_price_amount_stack_graph_data[:sales_price_amount][product.name] << sales_price_amount
    #   end
    # end

    # @current_vendor_group.contracts.each do |contract|
    #   @contracts_scatter_graph_data[:sales_amount] << contract.sales_amount
    #   @contracts_scatter_graph_data[:sales_price_amount] << contract.sales_price_amount
    #   @contracts_scatter_graph_data[:company_name] << contract.company.name
    #   @contracts_scatter_graph_data[:product_name] << contract.product.name
    # end
  end
end
