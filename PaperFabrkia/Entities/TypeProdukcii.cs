using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class TypeProdukcii
{
    public int IdTypeProdukcii { get; set; }

    public string? TypeProdukcii1 { get; set; }

    public virtual ICollection<Produkcium> Produkcia { get; set; } = new List<Produkcium>();
}
