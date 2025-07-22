package com.dnake.desktop;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import com.dnake.desktop.bean.TicaInnerStatus;
import com.dnake.desktop.handler.AirControlHandler;
import com.dnake.desktop.utils.CommonUtils;
import java.util.ArrayList;

/* loaded from: classes.dex */
public class RoomAdapter extends RecyclerView.Adapter<ViewHolder> {
    AirControlHandler airControlHandler;
    ArrayList<TicaInnerStatus> list;
    Context mContext;
    int selectPosition = 0;

    public RoomAdapter(Context context, ArrayList<TicaInnerStatus> arrayList, AirControlHandler airControlHandler) {
        this.mContext = context;
        this.list = arrayList;
        this.airControlHandler = airControlHandler;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int i) {
        return new ViewHolder(LayoutInflater.from(this.mContext).inflate(C0483R.layout.item_room, viewGroup, false));
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, final int i) {
        final TicaInnerStatus ticaInnerStatus = this.list.get(i);
        viewHolder.tvRoomName.setText(ticaInnerStatus.getRoomName());
        viewHolder.tvRoomName.setBackgroundResource(i == this.selectPosition ? C0483R.drawable.icon_room_bg_selected : C0483R.drawable.icon_room_bg);
        viewHolder.tvRoomName.setOnClickListener(new View.OnClickListener() { // from class: com.dnake.desktop.RoomAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                RoomAdapter.this.selectPosition = i;
                RoomAdapter.this.notifyDataSetChanged();
                RoomAdapter.this.airControlHandler.setTicaInnerStatus(ticaInnerStatus);
                RoomAdapter.this.airControlHandler.setMachineNo(ticaInnerStatus.getMachineNo());
                CommonUtils.getInstance().readInThread(RoomAdapter.this.airControlHandler);
            }
        });
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        ArrayList<TicaInnerStatus> arrayList = this.list;
        if (arrayList == null) {
            return 0;
        }
        return arrayList.size();
    }

    class ViewHolder extends RecyclerView.ViewHolder {
        TextView tvRoomName;

        public ViewHolder(View view) {
            super(view);
            this.tvRoomName = (TextView) view.findViewById(C0483R.id.tv_room_name);
        }
    }

    public void setSelectPosition(int i) {
        this.selectPosition = i;
    }
}
