using Misa.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Misa.Common.Results.Models
{
    public class NeigborsResult
    {
        public List<Ward> ListWard  { get;set; }
        public int SelectDistrict { get; set; }
        public List<District> ListDistrict { get; set; }
        public int SelectCity { get; set; }
        public List<City> ListCity { get; set; }
        public int SelectCountry { get; set; }

        public NeigborsResult()
        {
            ListWard = new List<Ward>();
            ListDistrict = new List<District>();
            ListCity = new List<City>();
        }

    }
}
