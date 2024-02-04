window.components = [];
var controller = new LeadsController();
window.reloadLeads = () => {
  controller.listLeads().then((leads) => {
    controller.handleComponent("list-leads", { items: null }, ".fit-list-leads").then((resolution) => {
      controller.composeLeadList(leads);
    });
  });
};
window.reloadLeads();
