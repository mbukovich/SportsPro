using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SportsPro.Models
{
    public class TechSupportContext
    {
        private TechSupportEntities entities = new TechSupportEntities();

        public List<Customer> getAllCustomers()
        {
            var query = from c in entities.Customers
                        orderby c.Name
                        select c;

            List<Customer> list = null;

            if (query.Any()) list = query.ToList();

            return list;
        }

        public List<Technician> getAllTechnicians()
        {
            var query = from c in entities.Technicians
                        orderby c.Name
                        select c;

            List<Technician> list = null;

            if (query.Any()) list = query.ToList();

            return list;
        }

        public List<Product> getAllProducts()
        {
            var query = from c in entities.Products
                        orderby c.Name
                        select c;

            List<Product> list = null;

            if (query.Any()) list = query.ToList();

            return list;
        }

        public List<Incident> getOpenIncidents()
        {
            var query = from c in entities.Incidents
                        where !c.DateClosed.HasValue
                        orderby c.DateOpened
                        select c;

            List<Incident> list = null;

            if (query.Any()) list = query.ToList();

            return list;
        }

        public List<Incident> returnIncidents (int customerID)
        {
            var query = from c in entities.Incidents
                        where c.CustomerID == customerID
                        orderby c.DateOpened
                        select c;

            List<Incident> list = null;

            if (query.Any()) list = query.ToList();

            return list;
        }

        public int addIncident(Incident incident)
        {
            entities.Incidents.Add(incident);

            return entities.SaveChanges();
        }

        public int closeIncident(int incidentID)
        {
            var query = from c in entities.Incidents
                        where c.IncidentID == incidentID
                        select c;

            Incident updatedIncident = query.SingleOrDefault();

            updatedIncident.DateClosed = DateTime.Now;
            
            return entities.SaveChanges();
        }
    }
}