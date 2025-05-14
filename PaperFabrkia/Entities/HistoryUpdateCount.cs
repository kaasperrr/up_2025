using System;
using System.Collections.Generic;

namespace PaperFabrkia.Entities;

public partial class HistoryUpdateCount
{
    public int IdHistoryupdate { get; set; }

    public string? NameMaterial { get; set; }

    public decimal? CountOld { get; set; }

    public decimal? CountNew { get; set; }
}
