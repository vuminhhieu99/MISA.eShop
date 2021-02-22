using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Requests.Shop
{
    public class PageRequest : PageRequestBase
    {
        public string ShopCode { get; set; }
        public string ShopName { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string StatusId { get; set; }
        public PageRequest() : base()
        {
            ;
            
        }
    }
}
