//using Microsoft.AspNetCore.Mvc.ViewEngines;
//using Microsoft.AspNetCore.Mvc;
//using Umbraco.Cms.Core.Web;
//using Umbraco.Cms.Web.Common.Controllers;

//namespace UmbracoFinalPo.Controller
//{
//    public class ProductPageController
//    {
//    }
//}

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.Extensions.Logging;
using Umbraco.Cms.Core.Web;
using Umbraco.Cms.Web.Common.Controllers;

namespace UmbracoFinalPo.Controller;

public class ProductPageController : RenderController
{
    public ProductPageController(ILogger<ProductPageController> logger, ICompositeViewEngine compositeViewEngine, IUmbracoContextAccessor umbracoContextAccessor)
        : base(logger, compositeViewEngine, umbracoContextAccessor)
    {
    }

    public override IActionResult Index()
    {
        // you are in control here!

        // return a 'model' to the selected template/view for this page.
        return CurrentTemplate(CurrentPage);
    }
}